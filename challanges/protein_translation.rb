class InvalidCodonError < StandardError; end
# comment
module Translation
  AMINO_ACIDS = {
    'Leucine' => %w(UUA UUG),
    'Serine' => %w(UCU UCC UCA UCG),
    'Cysteine' => %w(UGU UGC),
    'Tryptophan' => %w(UGG),
    'STOP' => %w(UAA UAG UGA),
    'Methionine' => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Tyrosine' => %w(UAU UAC)
  }.freeze

  def self.of_rna(strand)
    strand.scan(/.{3}/).each_with_object([]) do |segment, translation|
      raise InvalidCodonError if of_codon(segment).nil?
      return translation if of_codon(segment) == 'STOP'
      translation << of_codon(segment)
    end
  end

  def self.of_codon(string)
    AMINO_ACIDS.select do |k, v|
      k if v.include?(string)
    end.keys[0]
  end
end
