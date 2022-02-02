//
//  GraphView.swift
//  Weather
//
//  Created by 구민영 on 2022/02/02.
//

import UIKit
import Foundation

private struct Constants {
  static let circleDiameter: CGFloat = 4.0
    static let margin: CGFloat = 0
    static let topBorder: CGFloat = 0
    static let bottomBorder: CGFloat = 0
}

enum GraphKey {
    case humidity
    case tempMin
    case tempMax
    
    func color() -> UIColor {
        switch self {
        case .humidity:
            return UIColor.black
        case .tempMin:
            return UIColor.blue
        case .tempMax:
            return UIColor.red
        }
    }
    
    // 최대값
    func maxY() -> Double {
        switch self {
        case .humidity:
            return 100
        case .tempMin:
            return 50
        case .tempMax:
            return 50
        }
    }
    
    // y원점 조절값
    func translateY() -> Double {
        switch self {
        case .humidity:
            return 0
        case .tempMin:
            return -50
        case .tempMax:
            return -50
        }
    }
}

class GraphView: UIView {
    var graphPoints: (key: GraphKey, value: [Double])?
    
    override func draw(_ rect: CGRect){
        //print(#function)
        guard let graphPoints = graphPoints else {
            return
        }
        
        let width = rect.width
        let height = rect.height
        if let ctx = UIGraphicsGetCurrentContext() {
            ctx.translateBy(x: 0, y: graphPoints.key.translateY())
        }
        
        let graphHeight = height
        let columnYPoint = { (graphPoint: Double) -> CGFloat in
            let y = CGFloat(graphPoint) / CGFloat(graphPoints.key.maxY()) * graphHeight
              return graphHeight - y
        }
        
        graphPoints.key.color().setFill()
        graphPoints.key.color().setStroke()

        let graphPath = UIBezierPath()
        var currentX: CGFloat = 0
        let xOffset: CGFloat = self.frame.width / CGFloat(graphPoints.value.count)
        // 첫 좌표 그리기 시작
        graphPath.move(to: CGPoint(x: currentX, y: columnYPoint(graphPoints.value[0])))
            
        // 남은 좌표 연결
        for i in 0..<graphPoints.value.count {
            currentX += xOffset
            let nextPoint = CGPoint(x: currentX, y: columnYPoint(graphPoints.value[i]))
          graphPath.addLine(to: nextPoint)
        }

        graphPath.stroke()
        
        // 점 찍기
        currentX = xOffset
        for i in 1..<graphPoints.value.count {
            currentX += xOffset
            var point = CGPoint(x: currentX, y: columnYPoint(graphPoints.value[i]))
          point.x -= Constants.circleDiameter / 2
          point.y -= Constants.circleDiameter / 2
              
          let circle = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: Constants.circleDiameter, height: Constants.circleDiameter)))
          circle.fill()
        }
        UIColor.green.setFill()
        UIColor.green.setStroke()
    }
}
