///clase de como va a lucir el evento
part of 'calculator_bloc.dart';



class CalculatorState {
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operation;

  CalculatorState({ //ponemos llaves, para que se pueda usar en otras clases
    this.mathResult = '30', 
    this.firstNumber = '10', 
    this.secondNumber = '20', 
    this.operation = '+'
    
});
}
