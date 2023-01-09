//
//  Enums.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import Foundation

enum SearchCriteria {
    case Product
    case Structure
    case Segment
    case Solution
}

enum Product: String {
    case Duo
}

enum Structure: String {
    case Wall
    case Column
    case Slab
    case Culvert
    case Tank
}

enum Segment: String {
    case Residential
    case NonResidential = "Non-Residential"
    case Infrastrucutre
    case Industrial
}

enum Solution: String {
    case ChamferCorner = "Chamfer Corner"
    case StraightWall = "Straight Wall"
    case Traveller
}

// Segment

enum Infrastructure: String {
    case Bridges
    case Tunnels
    case LandTraffics = "Land Traffics"
    case Airports
    case MarineAndWaterInfrastructur = "Marine & Water Infrastructure"
    case WaterPlants = "Water Plants"
}

// Segment - Infrastructure

enum Tunnel: String {
    case RoadTunnels = "Road Tunnels"
    case RailwayTunnels = "Railway Tunnels"
    case NonTrafficTunnels = "Non-traffic Tunnels"
}

enum WaterPlant: String {
    case WaterTreatmentPlants = "Water Treatment Plants"
    case ElevatedWaterTowers = "Elevated Water Towers"
    case DesalinationPlants = "Desalination Plants"
}


