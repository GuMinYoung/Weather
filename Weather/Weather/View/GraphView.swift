//
//  GraphView.swift
//  Weather
//
//  Created by 구민영 on 2022/02/02.
//

import UIKit

private struct Constants {
  static let cornerRadiusSize = CGSize(width: 8.0, height: 8.0)
  static let margin: CGFloat = 20.0
  static let topBorder: CGFloat = 60
  static let bottomBorder: CGFloat = 50
  static let colorAlpha: CGFloat = 0.3
  static let circleDiameter: CGFloat = 5.0
}

class GraphView: UIView {
    var graphPoints = [Double]()
    var color = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect){
        print(#function)
        let width = rect.width
        let height = rect.height
        if let ctx = UIGraphicsGetCurrentContext() {
            ctx.translateBy(x: 0, y: height*0.5)
        }
          
        //calculate the x point
        let margin = Constants.margin
        let graphWidth = width - margin * 2 - 4
        let columnXPoint = { (column: Double) -> CGFloat in
          //Calculate the gap between points
            let spacing = graphWidth / CGFloat(self.graphPoints.count - 1)
          return CGFloat(column) * spacing + margin + 2
        }
        
        // calculate the y point
        let topBorder = Constants.topBorder
        let bottomBorder = Constants.bottomBorder
        let graphHeight = height
        let maxValue = self.graphPoints.max()!
        let columnYPoint = { (graphPoint: Double) -> CGFloat in
          //let y = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
          //return graphHeight + topBorder - y // Flip the graph
            let y = graphHeight * CGFloat(graphPoint) / 20
            return y
        }
        
        // draw the line graph
        self.color.setFill()
        self.color.setStroke()
            
        // set up the points line
        let graphPath = UIBezierPath()

        // go to start of line
        graphPath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(self.graphPoints[0])))
            
        // add points for each item in the graphPoints array
        // at the correct (x, y) for the point
        for i in 1..<self.graphPoints.count {
            let nextPoint = CGPoint(x: columnXPoint(Double(i)), y: columnYPoint(self.graphPoints[i]))
          graphPath.addLine(to: nextPoint)
        }
        
        // @test
        //let nextPoint = CGPoint(x: 0, y: 0)
      //graphPath.addLine(to: CGPoint(x: 0, y: 0))
        //graphPath.addLine(to: CGPoint(x: 30, y: 30))

        graphPath.stroke()
        
        //Draw the circles on top of the graph stroke
        for i in 0..<self.graphPoints.count {
            var point = CGPoint(x: columnXPoint(Double(i)), y: columnYPoint(self.graphPoints[i]))
          point.x -= Constants.circleDiameter / 2
          point.y -= Constants.circleDiameter / 2
              
          let circle = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: Constants.circleDiameter, height: Constants.circleDiameter)))
          circle.fill()
        }
    }
    /*
    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
          
        //calculate the x point
        let margin = Constants.margin
        let graphWidth = width - margin * 2 - 4
        let columnXPoint = { (column: Int) -> CGFloat in
          //Calculate the gap between points
          let spacing = graphWidth / CGFloat(self.graphPoints.count - 1)
          return CGFloat(column) * spacing + margin + 2
        }
        
        // calculate the y point
        let topBorder = Constants.topBorder
        let bottomBorder = Constants.bottomBorder
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = graphPoints.max()!
        let columnYPoint = { (graphPoint: Int) -> CGFloat in
          let y = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
          return graphHeight + topBorder - y // Flip the graph
        }
        
        // draw the line graph
        UIColor.red.setFill()
        UIColor.red.setStroke()
            
        // set up the points line
        let graphPath = UIBezierPath()

        // go to start of line
        graphPath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(graphPoints[0])))
            
        // add points for each item in the graphPoints array
        // at the correct (x, y) for the point
        for i in 1..<graphPoints.count {
          let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
          graphPath.addLine(to: nextPoint)
        }

        graphPath.stroke()
        
        //Draw the circles on top of the graph stroke
        for i in 0..<graphPoints.count {
          var point = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
          point.x -= Constants.circleDiameter / 2
          point.y -= Constants.circleDiameter / 2
              
          let circle = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: Constants.circleDiameter, height: Constants.circleDiameter)))
          circle.fill()
        }
    }
     */
}
