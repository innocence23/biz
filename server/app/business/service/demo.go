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

type Demo struct {
	service.Service
}

// GetPage 获取Demo列表
func (e *Demo) GetPage(c *dto.DemoGetPageReq, p *actions.DataPermission, list *[]models.Demo, count *int64) error {
	var err error
	var data models.Demo

	err = e.Orm.Model(&data).
		Scopes(
			cDto.MakeCondition(c.GetNeedSearch()),
			cDto.Paginate(c.GetPageSize(), c.GetPageIndex()),
			actions.Permission(data.TableName(), p),
		).
		Find(list).Limit(-1).Offset(-1).
		Count(count).Error
	if err != nil {
		e.Log.Errorf("DemoService GetPage error:%s \r\n", err)
		return err
	}
	return nil
}

// Get 获取Demo对象
func (e *Demo) Get(d *dto.DemoGetReq, p *actions.DataPermission, model *models.Demo) error {
	var data models.Demo

	err := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).
		First(model, d.GetId()).Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Errorf("Service GetDemo error:%s \r\n", err)
		return err
	}
	if err != nil {
		e.Log.Errorf("db error:%s", err)
		return err
	}
	return nil
}

// Insert 创建Demo对象
func (e *Demo) Insert(c *dto.DemoInsertReq) error {
    var err error
    var data models.Demo
    c.Generate(&data)
	err = e.Orm.Create(&data).Error
	if err != nil {
		e.Log.Errorf("DemoService Insert error:%s \r\n", err)
		return err
	}
	return nil
}

// Update 修改Demo对象
func (e *Demo) Update(c *dto.DemoUpdateReq, p *actions.DataPermission) error {
    var err error
    var data = models.Demo{}
    e.Orm.Scopes(
            actions.Permission(data.TableName(), p),
        ).First(&data, c.GetId())
    c.Generate(&data)

    db := e.Orm.Save(&data)
    if db.Error != nil {
        e.Log.Errorf("DemoService Save error:%s \r\n", err)
        return err
    }
    if db.RowsAffected == 0 {
        return errors.New("无权更新该数据")
    }
    return nil
}

// Remove 删除Demo
func (e *Demo) Remove(d *dto.DemoDeleteReq, p *actions.DataPermission) error {
	var data models.Demo

	db := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).Delete(&data, d.GetId())
	if err := db.Error; err != nil {
        e.Log.Errorf("Service RemoveDemo error:%s \r\n", err)
        return err
    }
    if db.RowsAffected == 0 {
        return errors.New("无权删除该数据")
    }
	return nil
}