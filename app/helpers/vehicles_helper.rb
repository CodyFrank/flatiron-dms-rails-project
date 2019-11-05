module VehiclesHelper
    
    def make_collection
        collection = []
        Vehicle.all.each do |veh|
            collection << veh.make
        end
        collection.uniq
    end
end
