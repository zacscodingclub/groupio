class User < ApplicationRecord
  after_create :create_tenant
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :confirmable, request_keys: [:subdomain]

  validates_presence_of :first_name, :last_name, :email, :password
  validates :subdomain, presence: true, uniqueness: true

   def self.find_for_authentication(warden_conditions)
     where(:email => warden_conditions[:email], :subdomain => warden_conditions[:subdomain]).first
   end

   private
     def create_tenant
       Apartment::Tenant.create(subdomain)
     end
end
