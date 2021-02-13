class AddTables < ActiveRecord::Migration[5.2]
  def change

    create_table :artists do |t|
      t.string  :name
      t.timestamps
    end

    create_table :albums do |t|
      t.string  :title
      t.references :artist, index: true, foreign_key: { to_table: :artists }
      t.timestamps
    end

    create_table :employees do |t|
      t.string  :last_name
      t.string  :first_name
      t.string  :email
      t.string  :title
      t.integer :reports_to
      t.date    :birth_date
      t.datetime  :hire_date
      t.string    :address
      t.string    :city
      t.string    :state
      t.string    :country
      t.string    :postal_code
      t.string    :phone
      t.string    :fax
      t.timestamps
    end

    create_table :customers do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :company
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :country
      t.string  :postal_code
      t.string  :phone
      t.string  :fax
      t.string  :email
      t.references :support_rep, index: true, foreign_key: { to_table: :employees }
      t.timestamps
    end

    create_table :genres do |t|
      t.string  :name
      t.timestamps
    end

    create_table :invoices do |t|
      t.references :customer, foreign_key: { to_table: :customers }
      t.datetime :invoice_date
      t.string   :billing_address
      t.string   :billing_city
      t.string   :billing_state
      t.string   :billing_country
      t.string   :billing_postal_code
      t.integer  :total
      t.timestamps
    end

    create_table :media_types do |t|
      t.string  :name
      t.timestamps
    end

    create_table :playlists do |t|
      t.string :name
      t.timestamps
    end

    create_table :tracks do |t|
      t.string  :name
      t.references :album, foreign_key: { to_table: :albums }
      t.references :media_type, foreign_key: { to_table: :media_types }
      t.references :genre, foreign_key: { to_table: :genres }
      t.string :composer
      t.integer :milliseconds
      t.integer :bytes
      t.integer :unit_price
      t.timestamps
    end

    create_table :playlist_tracks do |t|
      t.references :playlist, foreign_key: { to_table: :playlists }
      t.references  :track, foreign_key: { to_table: :tracks }
      t.timestamps
    end

    create_table :invoice_lines do |t|
      t.references :invoice, foreign_key: { to_table: :invoices }
      t.references :track, foreign_key: { to_table: :tracks }
      t.integer   :unit_price
      t.integer   :quantity
      t.timestamps
    end

  end
end
