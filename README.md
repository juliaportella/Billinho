# Sistema de Cadastro de Instituições, Alunos, Matrículas e Geração de Mensalidades
## Parâmetros:

- `institution_id`: (int) ID da instituição;
- `student_id`: (int) ID da do estudante;
- `enrollment_id`: (int) ID da matricula;

## Comportamento:

 - Faz a validação dos argumentos passados
 - Cria mensalidades para o aluno que tenha matricula
 - Valida e Calcula as datas de vencimento das mensalidades

## Modo de usar:

```Ruby
Bill.create!(value: value_each_bill, due_date: due_date, status: 'Open', enrollment_id: id) 
```

