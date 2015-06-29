class Survey < ActiveRecord::Base
  mount_uploader :csv, CsvUploader

  has_many :participants  ,:dependent => :destroy
  has_many :questions ,:dependent => :destroy

  def parse
    row_counter = 0
    rating_columns = []
    CSV.read(csv.path).each do |row|
      #first row
      if row_counter == 0
        row.each_with_index do |r,counter|
          next if counter < 3
          rating_columns << counter if r == "ratingquestion"
        end

      elsif  row_counter == 1
        #second row
        row.each_with_index do |r,counter|
          next if !rating_columns.include? counter
          questions << Question.create(:category => r)
        end
      elsif row_counter == 2
        #third row
        question_counter = 0
        row.each_with_index do |r,counter|
          next if !rating_columns.include? counter
          questions[question_counter].update(:name => r)
          question_counter += 1
        end
      else
        #all other rows
        p = Participant.create(:email => row[0] , :employee_id => row[2] , :submitted_at => row[3])
        participants << p
        question_counter = 0
        row.each_with_index do |r,counter|
          next if !rating_columns.include? counter
          questions[question_counter].answers << Answer.create(:participant_id => p.id , :value => r)
          question_counter += 1
        end
      end

      row_counter += 1
    end

  end


end
