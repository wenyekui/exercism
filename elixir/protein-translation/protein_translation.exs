defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }

  def of_rna(rna) when rna == "" do
    {:ok, []}
  end

  def of_rna(rna) do
      codon = String.slice(rna, 0..2)

      {is_codon, protein} = of_codon(codon)  

      case is_codon do 
        :ok ->
            if protein == "STOP" do
              {:ok, []}
            else
              {is_rna, proteins} =  of_rna(String.slice(rna, 3..-1))
              case is_rna do
                :ok -> {:ok, [protein | proteins]}
                :error -> { :error, "invalid RNA" } 
              end
            end
        :error -> { :error, "invalid RNA" } 
      end
  end


  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
      codon_map = %{
          "UGU" => "Cysteine",
          "UGC" => "Cysteine",
          "UUA" => "Leucine",
          "UUG" => "Leucine",
          "AUG" => "Methionine",
          "UUU" => "Phenylalanine",
          "UUC" => "Phenylalanine",
          "UCU" => "Serine", 
          "UCC" => "Serine",
          "UCA" => "Serine",
          "UCG" => "Serine",
          "UGG" => "Tryptophan",
          "UAU" => "Tyrosine",
          "UAC" => "Tyrosine",
          "UAA" => "STOP", 
          "UAG" => "STOP",
          "UGA" => "STOP"
      }
      case codon_map[codon]  do
          nil -> { :error, "invalid codon" }
          protein -> { :ok, protein } 
      end
  end
end
