# Sistema de Cadastro de Instituições, Alunos, Matrículas e Geração de Mensalidades
## Parâmetros:

- `value_each_bill`:(float) valor de cada mensalidade
- `due_date`: (string) data de vencimento;
- `enrollment_id`: (int) ID da matricula;
- `status`: (string) status da mensalidade ('Open', 'Delayed', 'Paid')

## Comportamento:

 - Faz a validação dos argumentos passados
 - Cria mensalidades para o aluno que tenha matricula
 - Valida e Calcula as datas de vencimento das mensalidades

## Modo de usar:

```Ruby
Bill.create!(value: value_each_bill, due_date: due_date, status: status, enrollment_id: id) 
```

