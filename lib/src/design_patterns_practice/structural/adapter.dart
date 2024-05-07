// Class with an expected functionality
class Employee {
  final String name;
  const Employee(this.name);

  String get getName => name;
}

// An interface that is expected
abstract interface class EmployeeInformer {
  String getName();
}

// Adatper class
class EmployeeInformerAdapter implements EmployeeInformer {
  final Employee employee;

  EmployeeInformerAdapter({required this.employee});

  @override
  String getName() {
    return employee.getName;
  }
}

// final client class, that expected interface
class Client {
  final EmployeeInformer employeeInformer;
  const Client({required this.employeeInformer});
}

void main()
{
  const employee = Employee('John');
  final employeeInformer = EmployeeInformerAdapter(employee: employee);
  final client = Client(employeeInformer: employeeInformer);
  print(client.employeeInformer.getName());
}