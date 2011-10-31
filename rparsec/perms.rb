class PTree
  attr_reader :choice
  
  def initialize(choice = nil)
    @choice = choice ? choice : []    
  end

  def add(elem)
    if @choice == [] then 
      @choice = [Branch.new(PTree.new, elem)]
    else
      choice  = Marshal.load(Marshal.dump(@choice) )
      @choice = [Branch.new(PTree.new(@choice), elem)] + (others choice, elem)
    end

    return self 
  end

  def others(chs, elem)
    chs.map! do |branch|
      Branch.new (branch.ptree.add elem), branch.elem
    end   
  end
 
end 

class Branch 
  attr_accessor :ptree
  attr_reader   :elem

  def initialize (ptree, elem)
    @elem   = elem
    @ptree  = ptree 
  end

end

