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
    case Infrastructure
    case Industrial
}

enum SolutionTag: String, CaseIterable {
    case HighQualityConcreteSurface = "High Quality Concrete Surface"
    case Shaft
    case AFrame = "A-Frame"
    case AnchorToExistingWall = "Anchor To Existing Wall"
    case Basement
    case ChamferCorner = "Chamfer Corner"
    case CircularWall = "Circular Wall"
    case ColumWithTieRodAndNonTieRodVersion = "Colum With Tie-Rod And Non Tie-Rod Version"
    case ColumnWithoutTieRod = "Column W/o Tie-Rod"
    case ColumnWithTieRod = "Column With Tie-Rod"
    case ConcreteShoringBeam = "Concrete Shoring Beam"
    case DoubleSided = "Double-Sided"
    case DrainageChannel = "Drainage Channel"
    case EquipmentFoundation = "Equipment Foundation"
    case Inclined
    case MockUp = "Mock-Up"
    case Monolithic
    case SingleSided = "Single-Sided"
    case SlabAndBeamInOnePour = "Slab & Beam In One Pour"
    case SludgePumpTank = "Sludge Pump Tank"
    case SpindleSupport = "Spindle Support"
    case StraightWall = "Straight Wall"
    case Tank
    case TemporaryStructure = "Temporary Structure"
    case Traveller
    case TunnelSideWall = "Tunnel Side Wall"
    case TWall = "T-Wall"
    case Underground
    case UtilityTunnel = "Utility Tunnel"
    case WallAndSlabInOnePour = "Wall & Slab In One Pour"
    case WallPost = "Wall Post"
    case WallWithVoids = "Wall With Voids"
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


