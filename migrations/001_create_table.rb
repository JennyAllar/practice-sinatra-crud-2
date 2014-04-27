Sequel.migration do
  up do
    create_table(:bikes) do
      primary_key :id
      String :brand, null: false
      String :model, null: false
      Integer :year_made, default: 2014
    end
  end

  down do
    drop_table(:bikes)
  end
end