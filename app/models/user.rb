class User < ApplicationRecord
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file) 
    success = 0
    unsuccess = 0
  	CSV.foreach(file.path, headers: true, skip_blanks: true) do |row|
      @user =  User.new(row.to_hash) 
      if @user.save
        success += 1
       else
        unsuccess += 1
       end
  	end
     json =    {unsuccess: unsuccess, success: success}.to_json
     result =JSON.parse(json, object_class: OpenStruct)
    return result
  end
end
