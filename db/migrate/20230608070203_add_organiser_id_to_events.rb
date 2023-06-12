    class AddOrganiserIdToEvents < ActiveRecord::Migration[6.1]
      def change
        add_column :events, :organiser_id, :integer
      end
    end
