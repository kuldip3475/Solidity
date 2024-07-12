// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    int private result;

    function add(int a, int b) public returns (int) {
        result = a + b;
        return result;
    }

    function subtract(int a, int b) public returns (int) {
        result = a - b;
        return result;
    }

    function multiply(int a, int b) public returns (int) {
        result = a * b;
        return result;
    }

    function divide(int a, int b) public returns (int) {
        require(b != 0, "Division by zero is not allowed.");
        result = a / b;
        return result;
    }

    function getResult() public view returns (int) {
        return result;
    }
}
