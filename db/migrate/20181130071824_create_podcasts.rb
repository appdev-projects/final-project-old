class CreatePodcasts < ActiveRecord::Migration[5.1]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :episode
      t.text :podcast_description
      t.text :episode_description
      t.string :cover
      t.string :first_part
      t.string :second_part

      t.timestamps
    end
  end
end
