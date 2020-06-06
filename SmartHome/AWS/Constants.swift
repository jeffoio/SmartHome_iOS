//
//  Constants.swift
//  SmartHome
//
//  Created by jeff on 2020/06/05.
//  Copyright © 2020 TakHyun Jung. All rights reserved.
//

import Foundation
import AWSCore

//WARNING: To run this sample correctly, you must set the following constants.

let CertificateSigningRequestCommonName = "SmartHome Application"
let CertificateSigningRequestCountryName = "South Korea"
let CertificateSigningRequestOrganizationName = "Your Organization"
let CertificateSigningRequestOrganizationalUnitName = "Your Organizational Unit"

let POLICY_NAME = "YourPolicyName"

// This is the endpoint in your AWS IoT console. eg: https://xxxxxxxxxx.iot.<region>.amazonaws.com
let AWS_REGION = AWSRegionType.Unknown

//For both connecting over websockets and cert, IOT_ENDPOINT should look like
//https://xxxxxxx-ats.iot.REGION.amazonaws.com
let IOT_ENDPOINT = "https://a8w5khvupw35a-ats.iot.ap-northeast-2.amazonaws.com"
let IDENTITY_POOL_ID = "<REGION>:<UUID>"

//Used as keys to look up a reference of each manager
let AWS_IOT_DATA_MANAGER_KEY = "MyIotDataManager"
let AWS_IOT_MANAGER_KEY = "MyIotManager"
