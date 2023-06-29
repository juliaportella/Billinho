# Sistema de Cadastro de Instituições, Alunos, Matrículas e Geração de Mensalidades
## Parâmetros: 

#### Criação de Bill (Mensalidade)
- `enrollment_id`: (int) ID da matricula;
- `due_date`: (string) data de vencimento;
- `value_each_bill`:(float) valor de cada mensalidade
- `status`: (string) status da mensalidade ('Open', 'Delayed', 'Paid')

#### Criação de Enrollment (Matricula)
- `student_id`: (int) ID do aluno;
- `course`:(string) nome do curso;
- `institution_id`: (int) ID da instituição;
- `course_value`: (float) valor total do curso;
- `due_day`:(int) dia de vencimento da mensalidade;
- `quantity_bills`:(int) quantidade de mensalidades desejadas;

#### Criação de Institution (Instituições)
- `name`:(string) nome da instituição;
- `cnpj`: (string) Cnpj da instituição;
- `modality`: (string) modalidade da instituição ('University', 'School', 'Kindergarten');
 

#### Criação de Student (Aluno)
- `cpf`: (string) Cpf do aluno;
- `phone`: (string) telefone do aluno;
- `name`:(string) nome completo do aluno;
- `birthdate`: (date) nada de nascimento;
- `gender`: (string) gênero do aluno ('F', 'M');
- `payment_method`: (string) Forma de pagamento da mensalidade ('Boleto', 'Cartão')
 

## Comportamento:
 - Faz a validação dos argumentos passados
 - Cria mensalidades para o aluno que tenha matricula
 - Valida e Calcula as datas de vencimento das mensalidades

## Modo de usar:

```Ruby
Bill.create!(value: value_each_bill, due_date: due_date, status: status, enrollment_id: enrollment_id)

Enrollment.create!(institution_id: institution_id, student_id: student_id, course: course, quantity_bills: quantity_bills, due_day: due_day, course_value: course_value)

Student.create!(name: name, cpf: cpf, birthdate: birthdate, phone: phone, gender: gender, payment_method: payment_method)

Institution.create!(name: name, cnpj: cnpj, modality: modality)



