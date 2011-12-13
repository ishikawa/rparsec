module RParsec

  class PTree
    attr_reader :choice
    
    def initialize(choice = nil)
      @choice = choice ? choice : []    
    end

    def add(elem)
      if @choice == [] then 
        @choice = [Branch.new(PTree.new, elem)]
      else
        choice  = Marshal.load(Marshal.dump(@choice) ) #make a deep copy
        @choice = [Branch.new(PTree.new(@choice), elem)] + (others choice, elem)
      end

      return self 
    end

    def add_elems(elems)
      elems.map { |elem| self.add elem }
    end

    def num_elems
      @choice.length
    end

    def others(chs, elem)
      chs.map! do |branch|
        Branch.new (branch.ptree.add elem), branch.elem
      end   
    end

    private :others
 
  end 

  class Branch 
    attr_accessor :ptree
    attr_reader   :elem
    
    def initialize (ptree, elem)
      @elem   = elem
      @ptree  = ptree 
    end

  end


end 
