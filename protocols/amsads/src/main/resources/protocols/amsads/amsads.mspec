//
// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//

////////////////////////////////////////////////////////////////
// AMS/TCP Paket
////////////////////////////////////////////////////////////////

[type 'AMSPacket'
    [reserved   uint       16   '0x0000'                                      ]
    [implicit   uint       32   'header.lengthInBytes + data.lengthInBytes'   ]
    [simple     AMSHeader  'header'                                           ]
    [simple     ADSData    'data'                                             ]
]

[type 'AMSHeader'
    [simple     AMSNetId        'targetAmsNetId'    ]
    [simple     uint        16  'targetAmsPort'     ]
    [simple     AMSNetId        'sourceAmsNetId'    ]
    [simple     uint        16  'sourceAmsPort'     ]
    [enum       CommandId       'commandId'         ]
    [bitmask    State           'state'             ]
    [simple     uint        32  '../data.lengthInBytes'        ]
    [simple     uint        32  'errorCode']
    [simple     byte        32  'invokeId'          ]
]

[enum uint 16 'CommandId'
    ['0x00' INVALID]
    ['0x01' ADS_READ_DEVICE_INFO]
    ['0x02' ADS_READ]
    ['0x03' ADS_WRITE]
    ['0x04' ADS_READ_STATE]
    ['0x05' ADS_WRITE_CONTROL]
    ['0x06' ADS_ADD_DEVICE_NOTIFICATION]
    ['0x07' ADS_DELETE_DEVICE_NOTIFICATION]
    ['0x08' ADS_DEVICE_NOTIFICATION]
    ['0x09' ADS_READ_WRITE]
]

[bitmask byte 2 'State'
    ['0b0000_0000_0000_0001' RESPONSE]
    ['0b0000_0000_0000_0010' NO_RETURN]
    ['0b0000_0000_0000_0100' ADS_COMMAND]
    ['0b0000_0000_0000_1000' SYSTEM_COMMAND]
    ['0b0000_0000_0001_0000' HIGH_PRIORITY_COMMAND]
    ['0b0000_0000_0010_0000' TIMESTAMP_ADDED]
    ['0b0000_0000_0100_0000' UDP_COMMAND]
    ['0b0000_0000_1000_0000' INIT_COMMAND]
    ['0b1000_0000_0000_0000' BROADCAST]
]

[type 'AMSNetId'
    [simple     uint        8   'octet1'            ]
    [simple     uint        8   'octet2'            ]
    [simple     uint        8   'octet3'            ]
    [simple     uint        8   'octet4'            ]
    [simple     uint        8   'octet5'            ]
    [simple     uint        8   'octet6'            ]
]

[type 'ADSData'
   // TODO: implement me..... arrrrrrrggggggggggggg
   ....
]