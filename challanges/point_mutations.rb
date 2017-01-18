class DNA 
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(other_strand)
    limit = set_range(@strand, other_strand)
    (0...limit).count { |i| @strand[i] != other_strand[i] }
  end
  
  def set_range(first_strand, second_strand)
    first_strand.length < second_strand.length ? first_strand.length : second_strand.length
  end
end

p DNA.new('ACT').hamming_distance('GGA')