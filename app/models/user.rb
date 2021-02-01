class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :pages, through: :projects
  has_many :lighthouse_reports, through: :pages
  alias_attribute :reports,:lighthouse_reports
end
