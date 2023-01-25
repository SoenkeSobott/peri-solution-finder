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
    case DUO
    case PS100
}

enum Structure: String, CaseIterable {
    case Wall
    case Column
    case Culvert
    case Shoring
}

enum Segment: String, CaseIterable {
    case Infrastructure
    case Industrial
    case NonResidential = "Non-Residential"
    case Residential
}

enum SolutionTag: String, CaseIterable, Decodable {
    case HighQualityConcreteSurface = "high quality concrete surface"
    case Shaft = "shaft"
    case AFrame = "a-frame"
    case AnchorToExistingWall = "anchor to existing wall"
    case Basement = "basement"
    case ChamferCorner = "chamfer corner"
    case CircularWall = "circular wall"
    case ColumWithTieRodAndNonTieRodVersion = "colum with tie-rod and non tie-rod version"
    case ColumnWithoutTieRod = "column w/o tie-rod"
    case ColumnWithTieRod = "column with tie-rod"
    case ConcreteShoringBeam = "concrete shoring beam"
    case DoubleSided = "double-sided"
    case DrainageChannel = "drainage channel"
    case EquipmentFoundation = "equipment foundation"
    case Inclined = "inclined"
    case MockUp = "mock-up"
    case Monolithic = "monolithic"
    case SingleSided = "single-sided"
    case SlabAndBeamInOnePour = "slab & beam in one pour"
    case SludgePumpTank = "sludge pump tank"
    case SpindleSupport = "spindle support"
    case StraightWall = "straight wall"
    case Tank = "tank"
    case TemporaryStructure = "temporary structure"
    case Traveler = "traveler"
    case TunnelSideWall = "tunnel side wall"
    case TWall = "t-wall"
    case Underground = "underground"
    case UtilityTunnel = "utility tunnel"
    case WallAndSlabInOnePour = "wall & slab in one pour"
    case WallPost = "wall post"
    case WallWithVoids = "wall with voids"
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

enum NonResidential: String, CaseIterable {
    case OfficeBuildings = "Office Buildings"
    case RetailBuildings = "Retail Buildings"
    case LeisureAndHospitalityBuildings = "Leisure & Hospitality Buildings"
    case CulturalAndInstitutionalBuildings = "Cultural & Institutional Buildings"
    case HealthcareBuildings = "Healthcare Buildings"
    case TransportationAndLogisticsBuildings = "Transportation & Logistics Buildings"
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


