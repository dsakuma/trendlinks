class Tops < ActiveRecord::Migration
  def self.up
    execute "create table tops( url varchar(255),count bigint, id int(11) not null auto_increment, PRIMARY KEY (id))"
  end

  def self.down
    execute "drop table tops"
  end
end

