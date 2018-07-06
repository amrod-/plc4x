/*
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
*/
package org.apache.plc4x.java.ethernetip.model;

import org.apache.plc4x.java.api.model.Address;

import java.util.Objects;
import java.util.regex.Pattern;

public abstract class EtherNetIpAddress implements Address {

    public static final Pattern ADDRESS_PATTERN = Pattern.compile("(?<address>\\d+)");

    private final int objectNumber;
    private final int instanceNumber;
    private final int attributeNumber;

    private int connectionId;

    public EtherNetIpAddress(int objectNumber, int instanceNumber, int attributeNumber) {
        this.objectNumber = objectNumber;
        this.instanceNumber = instanceNumber;
        this.attributeNumber = attributeNumber;

        this.connectionId = -1;
    }

    public int getObjectNumber() {
        return objectNumber;
    }

    public int getInstanceNumber() {
        return instanceNumber;
    }

    public int getAttributeNumber() {
        return attributeNumber;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof EtherNetIpAddress)) {
            return false;
        }
        EtherNetIpAddress that = (EtherNetIpAddress) o;
        return objectNumber == that.objectNumber &&
            instanceNumber == that.instanceNumber &&
            attributeNumber == that.attributeNumber;
    }

    @Override
    public int hashCode() {

        return Objects.hash(objectNumber, instanceNumber, attributeNumber);
    }

    @Override
    public String toString() {
        return "EtherNetIpAddress{" +
            "object-number=" + objectNumber +
            "instance-number=" + instanceNumber +
            "attribute-number=" + attributeNumber +
            '}';
    }
}
