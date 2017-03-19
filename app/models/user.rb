class User < ApplicationRecord
  has_many :tasks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def open_tasks_for_company
    Task.where(company: company).count
  end

  def complete_tasks_for_company
    Task.where(company: company).count
  end
end
