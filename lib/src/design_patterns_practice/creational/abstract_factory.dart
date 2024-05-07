// Common bunnto interface
// ignore_for_file: avoid_print

interface class Button {
  const Button();
  void paint() => print('Painting...');
}

// Concrete Button
class IosButton implements Button {
  @override
  void paint() => print('Painting... IosButton');
}

class AndroidButton implements Button {
  @override
  void paint() => print('Painting... AndroidButton');
}

// Commont checkbox interface
interface class Checkbox {
  const Checkbox();
  void paint() => print('Painting... Checkbox');
}

// Concrete Checkbox
class IosCheckbox implements Checkbox {
  @override
  void paint() => print('Painting... IosCheckbox');
}

class AndroidCheckbox implements Checkbox {
  @override
  void paint() => print('Painting... AndroidCheckbox');
}

// Abstract factory interface
interface class Dialog {
  const Dialog();
  Button get createButton => const Button();
  Checkbox get createCheckbox => const Checkbox();
}

// Concrete factory
class IosDialog implements Dialog {
  const IosDialog();
  @override
  Button get createButton => IosButton();
  @override
  Checkbox get createCheckbox => IosCheckbox();
}

class AndroidDialog implements Dialog {
  const AndroidDialog();
  @override
  Button get createButton => AndroidButton();
  @override
  Checkbox get createCheckbox => AndroidCheckbox();
}

// abstract factory client
class Client {
  final Dialog dialog;
  const Client(this.dialog);

  void paint() {
    dialog.createButton.paint();
    dialog.createCheckbox.paint();
  }
}

void main() {
  Client client;
  client = const Client(IosDialog());
  client.paint();
  client = const Client(AndroidDialog());
  client.paint();
}
