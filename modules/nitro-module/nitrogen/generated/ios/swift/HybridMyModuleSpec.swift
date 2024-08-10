///
/// HybridMyModuleSpec.swift
/// Sat Aug 10 2024
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/react-native-nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * A Swift protocol representing the MyModule HybridObject.
 * Implement this protocol to create Swift-based instances of MyModule.
 *
 * When implementing this protocol, make sure to initialize `hybridContext` - example:
 * ```
 * public class HybridMyModule : HybridMyModuleSpec {
 *   // Initialize HybridContext
 *   var hybridContext = margelo.nitro.HybridContext()
 *
 *   // Return size of the instance to inform JS GC about memory pressure
 *   var memorySize: Int {
 *     return getSizeOf(self)
 *   }
 *
 *   // ...
 * }
 * ```
 */
public protocol HybridMyModuleSpec: HybridObjectSpec {
  // Properties
  

  // Methods
  func addNumbers(a: Double, b: Double) throws -> Double
  func addStrings(a: String, b: String) throws -> String
}

public extension HybridMyModuleSpec {
  /**
   * Create a new instance of HybridMyModuleSpecCxx for the given HybridMyModuleSpec.
   *
   * Instances of HybridMyModuleSpecCxx can be accessed from C++, and contain
   * additional required bridging code for C++ <> Swift interop.
   */
  func createCxxBridge() -> HybridMyModuleSpecCxx {
    return HybridMyModuleSpecCxx(self)
  }
}