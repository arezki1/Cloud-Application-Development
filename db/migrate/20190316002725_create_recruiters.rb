class CreateRecruiters < ActiveRecord::Migration[5.2]
  def change
    create_table :recruiters do |t|
      t.string :name
      t.string :firstname
      t.references :agency, foreign_key: true

      t.timestamps
    end
  end
end
