# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name:'Superman', email:'superadmin@local', superAdmin:true, password: 'admin', password_confirmation:'admin' )
User.create(name:'Petro', email:'test1@local',password: 'test', password_confirmation:'test' )
User.create(name:'Vasia', email:'test2@local',password: 'test', password_confirmation:'test' )
User.create(name:'Ivan', email:'test3@local',password: 'test', password_confirmation:'test' )
User.create(name:'John', email:'test4@local',password: 'test', password_confirmation:'test' )
User.create(name:'Eugene', email:'test5@local',password: 'test', password_confirmation:'test' )


# attr_accessible :name, :email,:isAdmin,:superAdmin, :password, :password_confirmation
# t.string   "email"
# t.string   "password_hash"
# t.string   "password_salt"
# t.datetime "created_at",                       :null => false
# t.datetime "updated_at",                       :null => false
# t.boolean  "isAdmin",       :default => false, :null => false
# t.string   "name"
# t.boolean  "superAdmin",    :default => false, :null => false