package service

import (
	"errors"

    "github.com/go-admin-team/go-admin-core/sdk/service"
	"gorm.io/gorm"

	"maktub/app/business/models"
	"maktub/app/business/service/dto"
	"maktub/common/actions"
	cDto "maktub/common/dto"
)

type ReportOperator struct {
	service.Service
}

// GetPage 获取ReportOperator列表
func (e *ReportOperator) GetPage(c *dto.ReportOperatorGetPageReq, p *actions.DataPermission, list *[]models.ReportOperator, count *int64) error {
	var err error
	var data models.ReportOperator

	err = e.Orm.Model(&data).
		Scopes(
			cDto.MakeCondition(c.GetNeedSearch()),
			cDto.Paginate(c.GetPageSize(), c.GetPageIndex()),
			actions.Permission(data.TableName(), p),
		).
		Find(list).Limit(-1).Offset(-1).
		Count(count).Error
	if err != nil {
		e.Log.Errorf("ReportOperatorService GetPage error:%s \r\n", err)
		return err
	}
	return nil
}

// Get 获取ReportOperator对象
func (e *ReportOperator) Get(d *dto.ReportOperatorGetReq, p *actions.DataPermission, model *models.ReportOperator) error {
	var data models.ReportOperator

	err := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).
		First(model, d.GetId()).Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Errorf("Service GetReportOperator error:%s \r\n", err)
		return err
	}
	if err != nil {
		e.Log.Errorf("db error:%s", err)
		return err
	}
	return nil
}

// Insert 创建ReportOperator对象
func (e *ReportOperator) Insert(c *dto.ReportOperatorInsertReq) error {
    var err error
    var data models.ReportOperator
    c.Generate(&data)
	err = e.Orm.Create(&data).Error
	if err != nil {
		e.Log.Errorf("ReportOperatorService Insert error:%s \r\n", err)
		return err
	}
	return nil
}

// Update 修改ReportOperator对象
func (e *ReportOperator) Update(c *dto.ReportOperatorUpdateReq, p *actions.DataPermission) error {
    var err error
    var data = models.ReportOperator{}
    e.Orm.Scopes(
            actions.Permission(data.TableName(), p),
        ).First(&data, c.GetId())
    c.Generate(&data)

    db := e.Orm.Save(&data)
    if db.Error != nil {
        e.Log.Errorf("ReportOperatorService Save error:%s \r\n", err)
        return err
    }
    if db.RowsAffected == 0 {
        return errors.New("无权更新该数据")
    }
    return nil
}

// Remove 删除ReportOperator
func (e *ReportOperator) Remove(d *dto.ReportOperatorDeleteReq, p *actions.DataPermission) error {
	var data models.ReportOperator

	db := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).Delete(&data, d.GetId())
	if err := db.Error; err != nil {
        e.Log.Errorf("Service RemoveReportOperator error:%s \r\n", err)
        return err
    }
    if db.RowsAffected == 0 {
        return errors.New("无权删除该数据")
    }
	return nil
}