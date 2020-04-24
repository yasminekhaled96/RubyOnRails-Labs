class ComplexNumber
    attr_reader :a, :b

    @@count={
        "+(other)" =>0 ,
        "*(other)" =>0 ,
        "bulk_add" =>0 ,
        "bulk_multiply" =>0 ,
    };

    def initialize(a, b)
        @a = a
        @b = b
      end

    def real
        a
      end
    
      def imaginary
        b
      end

    def +(other)
        @@count["+(other)"]+=1
        add = ComplexNumber.new(a + other.a, b + other.b)
        puts "#{add.real} +  #{add.imaginary}i"
    end

    def *(other)
        @@count["*(other)"]+=1
        multiply= ComplexNumber.new(
          a * other.a - b * other.b,
          b * other.a + a * other.b
        )
        puts "#{multiply.real} +  #{multiply.imaginary}i" 
      end

      def self.bulk_add(array)
        @@count["bulk_add"]+=1
        var=array[1]
        array.drop(1).each do |array|
            var=var+array
        end
        var
      end

      def self.bulk_multiply(array)
        @@count["bulk_multiply"]+=1
        var=array[1]
        array.drop(1).each do |array|
            var=var*array
        end
        var
      end

      def self.get_state
        puts @@count
      end
    end

    obj = ComplexNumber.new(1,2)
    obj2 = ComplexNumber.new(1,2)
    obj.+(obj2)
    obj.*(obj2)
    arr=[obj,obj2]
   puts ComplexNumber.bulk_add(arr)
   puts ComplexNumber.bulk_multiply(arr) 
   ComplexNumber.get_state
    