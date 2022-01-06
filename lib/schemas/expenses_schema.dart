final categories = ["FIXA", "VARIAVEL", "EXTRA", "ADICIONAL"];

class ExpenseOption {
  String name;
  String category;

  ExpenseOption(this.name, this.category);
}

final expenses = {
  // Fixa
  "Aluguel": ExpenseOption("Aluguel", categories[0]),
  "Diarista": ExpenseOption("Diarista", categories[0]),
  "Internet": ExpenseOption("Internet", categories[0]),
  "Curso": ExpenseOption("Curso", categories[0]),
  "Outros Fixos": ExpenseOption("Outros Fixos", categories[0]),
  // Variárveis
  "Água": ExpenseOption("Água", categories[1]),
  "Luz": ExpenseOption("Luz", categories[1]),
  "Cartão de crédito": ExpenseOption("Cartão de crédito", categories[1]),
  "Gás": ExpenseOption("Gás", categories[1]),
  "Transporte": ExpenseOption("Transporte", categories[1]),
  "Supermecado": ExpenseOption("Supermecado", categories[1]),
  "Feira": ExpenseOption("Feira", categories[1]),
  "Padaria": ExpenseOption("Padaria", categories[1]),
  "Medicamento": ExpenseOption("Medicamento", categories[1]),
  "Academia": ExpenseOption("Academia", categories[1]),
  "Outros Variáveis": ExpenseOption("Outros Variáveis", categories[1]),
  // Extra
  "Manutenção de casa": ExpenseOption("Manutenção de casa", categories[2]),
  "Uniforme": ExpenseOption("Uniforme", categories[2]),
  "Saúde": ExpenseOption("Saúde", categories[2]),
  // Adicioanais
  "Viagem": ExpenseOption("Viagem", categories[3]),
  "Restaurante": ExpenseOption("Restaurante", categories[3]),
  "Roupas": ExpenseOption("Roupas", categories[3]),
  "Presentes": ExpenseOption("Presentes", categories[3]),
};
