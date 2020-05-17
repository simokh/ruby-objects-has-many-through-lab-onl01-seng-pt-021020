class Patient

    attr_accessor :name, :appointment, :doctor 

    @@all = []

    def initialize(name)
        @name = name 
        save
    end

    def save 
        @@all << self 
    end

    def self.all
        @@all 
    end 

    def appointments
        Appointment.all.filter do |appt|
            appt.patient == self
        end 
    end 
    
    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end 
    
    def doctors
        self.appointments.collect {|appointment| appointment.doctor}
    end
    

end