//
//  Enums.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import Foundation

enum SearchCriteria: String, CaseIterable {
    case Product
    case Structure
    case Segment
    case Solution
}

enum Product: String, CaseIterable {
    case Duo
}

enum Structure: String, CaseIterable {
    case Wall
    case Column
    case Slab
    case Culvert
}

enum Segment: String, CaseIterable {
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

enum Infrastructure: String, CaseIterable {
    case Bridges
    case Tunnels
    case LandTraffic = "Land Traffic"
    case Airports
    case MarineAndWaterInfrastructur = "Marine & Water Infrastructure"
    case WaterPlants = "Water Plants"
}

enum Industrial: String, CaseIterable {
    case OilAndGas = "Oil & Gas"
    case Chemicals = "Chemicals"
    case Power = "Power"
    case MetalsAndMinerals = "Metals & Minerals"
    case IndustrializedManufacturing = "Industrialized Manufacturing"
}

enum Residential: String, CaseIterable {
    case MultiFamilyHousingAboveTenFloors = "Multi-Family housing above 10 floors"
    case MultiFamilyHousingUpToTenFloors = "Multi-Family housing up to 10 floors"
    case SingleFamilyHousing = "Single-Family Housing"
}

// Segment - Infrastructure

enum Tunnel: String, CaseIterable {
    case RoadTunnels = "Road Tunnels"
    case RailwayTunnels = "Railway Tunnels"
    case NonTrafficTunnels = "Non-traffic Tunnels"
}

enum WaterPlant: String, CaseIterable {
    case WaterTreatmentPlants = "Water Treatment Plants"
    case ElevatedWaterTowers = "Elevated Water Towers"
    case DesalinationPlants = "Desalination Plants"
}


