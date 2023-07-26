class AddTranseasyTables < ActiveRecord::Migration[7.0]
  def change

    drop_table :transeasy_translation_settings, if_exists: true
    drop_table :transeasy_translation_keys, if_exists: true
    drop_table :transeasy_translation_values, if_exists: true

    create_table :transeasy_translation_settings do |t|
      t.string :root_locale, null: false
      t.string :intermediate_locale
      t.text :target_locales, null: false
      t.timestamps
    end

    create_table :transeasy_translation_keys do |t|
      t.string :key
      t.boolean :active, default: true, null: false
      t.timestamps
    end

    create_table :transeasy_translation_values do |t|
      t.references :translation_key, index: { name: 'index_transeasy_translation_values_on_translation_key'}
      t.string :locale, limit: 5
      t.string :translation
      t.boolean :require_translation , default: true, null: false
      t.string :translated_by
      t.timestamps
    end

  end
end
