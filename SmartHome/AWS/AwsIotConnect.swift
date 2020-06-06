//
//  AwsIotConnect.swift
//  SmartHome
//
//  Created by jeff on 2020/06/06.
//  Copyright © 2020 TakHyun Jung. All rights reserved.
//

import Foundation
import AWSIoT
import SwiftyJSON

class AwsIotConnect {
    
    var clientId = String()
       
    func awsConnect() {
        let credentials = AWSCognitoCredentialsProvider(regionType:.APNortheast2, identityPoolId: "ap-northeast-2:3559ba65-31e9-4a92-b38a-aed42ce5df37")
        let configuration = AWSServiceConfiguration(region:.APNortheast2, credentialsProvider: credentials)
        // Initialising AWS IoT And IoT DataManager
        AWSIoT.register(with: configuration!, forKey: "kAWSIoT")
        let iotEndPoint = AWSEndpoint(urlString: "wss://a8w5khvupw35a-ats.iot.ap-northeast-2.amazonaws.com/mqtt") // Access from AWS IoT Core --> Settings
        let iotDataConfiguration = AWSServiceConfiguration(region: .APNortheast2,     // Use AWS typedef .Region
            endpoint: iotEndPoint,
            credentialsProvider: credentials)
        AWSIoTDataManager.register(with: iotDataConfiguration!, forKey: "kDataManager")
        // Access the AWSDataManager instance as follows:
        let dataManager = AWSIoTDataManager(forKey: "kDataManager")
        getAWSClientID { (clientId, err) in
            self.connectToAWSIoT(clientId: clientId)
        }
    }
    
    func getAWSClientID(completion: @escaping (_ clientId: String?,_ error: Error? ) -> Void) {
        let credentials = AWSCognitoCredentialsProvider(regionType:.APNortheast2, identityPoolId: "ap-northeast-2:3559ba65-31e9-4a92-b38a-aed42ce5df37")
        credentials.getIdentityId().continueWith(block: { (task:AWSTask<NSString>) -> Any? in
            if let error = task.error as NSError? {
                print("Failed to get client ID => \(error)")
                completion(nil, error)
                return nil  // Required by AWSTask closure
            }
            let clientId = task.result! as String
            self.clientId = clientId
            print("Got client ID => \(clientId)")
            completion(clientId, nil)
            return nil // Required by AWSTask closure
        })
    }
    
    func connectToAWSIoT(clientId: String!) {
        
        func mqttEventCallback(_ status: AWSIoTMQTTStatus ) {
            switch status {
            case .connecting: print("Connecting to AWS IoT")
            case .connected:
                print("Connected to AWS IoT")
                // Register subscriptions here
            // Publish a boot message if required
            case .connectionError: print("AWS IoT connection error")
            case .connectionRefused: print("AWS IoT connection refused")
            case .protocolError: print("AWS IoT protocol error")
            case .disconnected: print("AWS IoT disconnected")
            case .unknown: print("AWS IoT unknown state")
            default: print("Error - unknown MQTT state")
            }
        }
        
        // Ensure connection gets performed background thread (so as not to block the UI)
        DispatchQueue.global(qos: .background).async {
            do {
                print("Attempting to connect to IoT device gateway with ID = \(clientId ?? "error")")
                let dataManager = AWSIoTDataManager(forKey: "kDataManager")
                dataManager.connectUsingWebSocket(withClientId: clientId,
                                                  cleanSession: true,
                                                  statusCallback: mqttEventCallback)
                
            } catch {
                print("Error, failed to connect to device gateway => \(error)")
            }
        }
    }
    
    
   
}

