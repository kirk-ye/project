class CreateEnterprises < ActiveRecord::Migration
  def self.up
    create_table :enterprises do |t|
      t.column :EntName, :string
      t.column :CategoryId, :int
      t.column :CategoryLeft, :string
      t.column :Expenses,:string  # 经营范围
      t.column :Trade, :string  #行业
      t.column :EntType, :string  #企业类型
      t.column :RegisterTime, :string  #注册时间
      t.column :Address, :string #地址
      t.column :ZipCode, :string #邮编
      t.column :LinkTel, :string #联系电话
      t.column :LinkFax, :string  #传真
      t.column :Email, :string 
      t.column :RegisteredFund, :string #注册资金
      t.column :Turnover, :string  #年营业额
      t.column :AllPoples, :int  #企业人数
      t.column :Keywords, :string
      t.column :Area, :string
      t.column :ShowFirst, :int
      t.column :GoodNumber, :int
      t.column :BadNumber, :int
      
      t.column :FromId, :int #来源ID
      t.column :StatusId, :int #状态
      t.column :CreateTime, :datetime
      t.column :UpdateTime, :datetime
      t.column :FromIP, :string
    end
  end

  def self.down
    drop_table :enterprises
  end
end
