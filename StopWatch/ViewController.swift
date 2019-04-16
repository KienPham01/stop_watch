//
//  ViewController.swift
//  StopWatch
//
//  Created by Kien on 12/9/17.
//  Copyright © 2017 Kien. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var labs:[String] = []
    var fraction : Int = 0;
    var seconds:Int = 0
    var minutes:Int = 0
    var stopWatchString:String = ""
    var switchSatus:SwitchStatus = .on
    @IBOutlet weak var startButton: UIButton!
    
    
    
    
    @IBOutlet weak var labButton: UIButton!
    

    @IBOutlet weak var labTable: UITableView!
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    var startStopWatch = true
    var addLab:Bool = true
    
//    var isTimerRunning = false
    @IBOutlet weak var timerLabel: UILabel!
//    @IBOutlet weak var labLabel: UILabel!
    
    @IBAction func startButtonTap(_ sender: Any) {
//
        if  isTimerRunning == false {

                runTime()
//            labs.insert(stopWatchString, at: 0)
//            print(labs)
            
            isTimerRunning = true
//              labs.insert(stopWatchString)
//            labs.append(stopWatchString)
               startButton.setTitle("Start", for: .normal)
                labButton.setTitle("Lab", for: .normal)
       



        }else{
            
            timer.invalidate()
//              labs.insert(stopWatchString, at: 0)
            print("dinh menh nha m")
//
            isTimerRunning = false
            startButton.setTitle("Stop", for: .normal)
            labButton.setTitle("Reset", for: .normal)


        }

       
    }
    
   
    
    
    
    @IBAction func lapTap(_ sender: Any) {
    
      
        
        if resumeTapped ==  false {
            resumeTapped = true
            labs.append(stopWatchString)
            labTable.reloadData()
//            labs.removeAll()
//            labTable.reloadData()
//            labs.append(stopWatchString)
//            labTable.reloadData()


           


        }
        else{
            
            resumeTapped = false
//            labs.append(stopWatchString)
//            labTable.reloadData()

           
        }
        if isTimerRunning == false {
            isTimerRunning =  true
            labs.removeAll()
            labTable.reloadData()
            fraction = 0
                            minutes = 0
                            seconds = 0
                            stopWatchString = "00:00:00"
                            timerLabel.text  = stopWatchString
            
            
        }
//        switchSatus.toogle()
//        if switchSatus == .off{
//
//
//            labs.append(stopWatchString)
//            print(labs)
//
//            labTable.reloadData()
//              labs.append(stopWatchString)
//
//        }
//
//
//            if switchSatus == .on {
//
//                labs.removeAll()
//                labTable.reloadData()
//                fraction = 0
//                minutes = 0
//                seconds = 0
//                stopWatchString = "00:00:00"
//                timerLabel.text  = stopWatchString
//
//            }
//


       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "00:00:00"
        labTable.delegate = self
        labTable.dataSource = self
        startButton.skin(b: true)
        startButton.skin(b: false)

        
        labButton.skin(b: true)
//        labButton.skin(b: )
       
    }
    func runTime()  {
        
        timer = Timer.scheduledTimer(timeInterval: 0.012, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        resumeTapped =  false
        
        
    }
    

    
    
    @objc func updateTimer() {
        
        
        fraction += 1
        
        if fraction == 100 {
            seconds+=1
            fraction = 0;
       
        }
        if seconds == 60 {
            minutes += 1
            seconds = 0
            
        }
        
        if fraction%2==0 {
           
            fraction+=1
        }
        
        if(minutes < 10 && seconds<10)
        {


    
            let fractionString = "\(fraction)"
            let minuteString = "0\(minutes)"
            let secondString = "0\(seconds)"
            
                stopWatchString = "\(minuteString):\(secondString):\(fractionString)"
                timerLabel.text = stopWatchString
        }
        if( seconds>10 ){
//
           let fractionString = "\(fraction)"
           let minuteString = "0\(minutes)"
           let secondString = "\(seconds)"
            stopWatchString = "\(minuteString):\(secondString).\(fractionString)"
            timerLabel.text = stopWatchString
//
        }
        
        if (minutes > 10){
            
            let fractionString = "\(self.fraction)"
            let minuteString = "\(self.minutes)"
            let secondString = "\(self.seconds)"
            stopWatchString = "\(minuteString):\(secondString):\(fractionString)"
            timerLabel.text = stopWatchString
        }
    
        
        
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labs.count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! DisplayTimeViewCell
        
        cell.textLabel?.text = "Lab\(labs.count-indexPath.row)"
        
        cell.timeLabLabel.text = labs[indexPath.row]

        
        return cell
        
    }
    
    
    
}

