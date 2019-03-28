//
//  ViewController.swift
//  Skutarenko Enum
//
//  Created by Sasha on 3/28/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //:1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
        
        //: 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
        
        
        enum ChessFigure {
            case Figure (name: Name, color: Color, y: Y_position, x: X_position)
            
            enum Name: String {
                case King, Queen, Bishop
                case Knight, Rook, Pawn
            }
            
            enum Color: String {
                case White, Black
            }
            
            enum Y_position: String {
                case A, B, C, D, E, F, G, H
            }
            
            enum X_position: Int {
                case One = 1, Two, Three, Four, Five, Six, Seven, Eight
            }
        }
        
        
        var blackKing = ChessFigure.Figure(name: .King, color: .Black, y: .E, x: .Eight)
        var whiteRook1 = ChessFigure.Figure(name: .Rook, color: .White, y: .A, x: .Eight)
        var whiteRook2 = ChessFigure.Figure(name: .Rook, color: .White, y: .B, x: .Seven)
        
        
        var chessMass = [blackKing, whiteRook1, whiteRook2]
        
        
        func describeChessPosition (chess: ChessFigure) {
            switch chess {
            case .Figure (let name, let color, let y, let x) :
                print("\(color) \(name) on position \(y)\(x.rawValue)")
            default: break
            }
        }
        
        func describeArrayPosition (chessArr: [ChessFigure]) {
            for i in chessArr {
                describeChessPosition(chess: i)
            }
        }
        
        describeArrayPosition(chessArr: chessMass)
        
        //:3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
        
        let blackCell = "⬛️"
        let whiteCell = "⬜️"
        
        let blackDict = ["King" : "♔", "Queen" : "♕", "Bishop" : "♗",
                         "Knight" : "♘", "Rook" : "♖", "Pawn" : "♙" ]
        
        let whiteDict = ["King" : "♚", "Queen" : "♛", "Bishop" : "♝",
                         "Knight" : "♞", "Rook" : "♜", "Pawn" : "♠︎" ]
        
        
        
        func drawBoard (chessPos: [ChessFigure]) {
            
            let x = ["A","B","C","D","E","F","G","H"]
            let y = [1,2,3,4,5,6,7,8]
            
            
            for num in y {
                var line = "\(9-num)"
                counter: for (key, char) in x.enumerated() {
                    
                    for chess in chessPos {
                        switch chess {
                        case .Figure(let name, let color, let y, let x) where y.rawValue == char && x.rawValue == num && name == .King:
                            line.append(contentsOf: color == .White ? "♚" : "♔")
                            continue counter
                        case .Figure(let name, let color, let y, let x) where y.rawValue == char && x.rawValue == num && name == .Queen:
                            line.append(contentsOf: color == .White ? "♛" : "♕")
                            continue counter
                        case .Figure(let name, let color, let y, let x) where y.rawValue == char && x.rawValue == num && name == .Bishop:
                            line.append(contentsOf: color == .White ? "♝" : "♗")
                            continue counter
                        case .Figure(let name, let color, let y, let x) where y.rawValue == char && x.rawValue == num && name == .Knight:
                            line.append(contentsOf: color == .White ? "♞" : "♘")
                            continue counter
                        case .Figure(let name, let color, let y, let x) where y.rawValue == char && x.rawValue == num && name == .Rook:
                            line.append(contentsOf: color == .White ? "♜" : "♖")
                            continue counter
                        case .Figure(let name, let color, let y, let x) where y.rawValue == char && x.rawValue == num && name == .Pawn:
                            line.append(contentsOf: color == .White ? "♠︎" : "♙")
                            continue counter
                        default: break
                        }
                    }
                    line.append(contentsOf: (key + 1) % 2 == num % 2 ? whiteCell : blackCell)
                }
                print(line)
            }
            print(" A B C D E F G H")
        }
        
        //let blackKing = ChessFigure.Figure(name: .King, color: .Black, y: .E, x: .Eight)
        //let whiteRook1 = ChessFigure.Figure(name: .Rook, color: .White, y: .A, x: .Eight)
        //let whiteRook2 = ChessFigure.Figure(name: .Rook, color: .White, y: .B, x: .Seven)
        
        
        drawBoard(chessPos: chessMass)
        
        
        
        //func makeAMove (chess: inout ChessFigure, nextStep: (newX: Int, newY: String)) {
        //    switch chess {
        //
        //    case .Figure(.King, .White, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .King, color: .White, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //    case .Figure(.King, .Black, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .King, color: .Black, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //
        //    case .Figure(.Queen, .White, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Queen, color: .White, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //    case .Figure(.Queen, .Black, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Queen, color: .Black, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //
        //    case .Figure(.Bishop, .White, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Bishop, color: .White, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //    case .Figure(.Bishop, .Black, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Bishop, color: .Black, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //
        //    case .Figure(.Knight, .White, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Knight, color: .White, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //    case .Figure(.Knight, .Black, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Knight, color: .Black, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //
        //    case .Figure(.Rook, .White, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Rook, color: .White, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //    case .Figure(.Rook, .Black, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Rook, color: .Black, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //
        //    case .Figure(.Pawn, .White, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Pawn, color: .White, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //    case .Figure(.Pawn, .Black, let yy, let xx):
        //        chess = ChessFigure.Figure(name: .Pawn, color: .Black, y: ChessFigure.Y_position(rawValue: nextStep.newY)!, x: ChessFigure.X_position(rawValue: nextStep.newX)!)
        //
        //    default: break
        //    }
        //}
        
        func makeAMove (chess: inout ChessFigure, nextStep: (newX: Int, newY: String)) {
            switch chess {
            case .Figure(let n, let c , _, _):
                chess = ChessFigure.Figure(name: n, color: c, y: ChessFigure.Y_position(rawValue: nextStep.newY)!,
                                           x: ChessFigure.X_position(rawValue: nextStep.newX)!)
            default: break
            }
            
        }
        
        
        
        makeAMove(chess: &chessMass[0], nextStep: (newX: 6, newY: "D"))
        drawBoard(chessPos: chessMass)
        

    }


}

