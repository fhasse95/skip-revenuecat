// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

// Skip transpiles this to: import multi.platform.library.*

#if SKIP
import com.revenuecat.purchases.kmp.__

// I cannot re-export packages here, so I use typealiases.
public typealias Purchases = com.revenuecat.purchases.kmp.Purchases
public typealias CustomerInfo = com.revenuecat.purchases.kmp.models.CustomerInfo
public typealias Offerings = com.revenuecat.purchases.kmp.models.Offerings
public typealias StoreProduct = com.revenuecat.purchases.kmp.models.StoreProduct
public typealias PurchasesDelegate = com.revenuecat.purchases.kmp.PurchasesDelegate
public typealias PurchasesError = com.revenuecat.purchases.kmp.models.PurchasesError
public typealias StoreTransaction = com.revenuecat.purchases.kmp.models.StoreTransaction
public typealias KotlinBoolean = Bool
public typealias KotlinUnit = Unit
public typealias LogLevel = com.revenuecat.purchases.kmp.LogLevel

public extension Purchases {
    static func configure(apiKey: String, builder: @escaping (PurchasesConfiguration.Builder) -> Void = { _ in }) {
        Purchases.configure(PurchasesConfiguration(apiKey: apiKey, builder: builder))
        Void
    }
}
#else
@_exported import RevenueCat
@_exported import RevenueCatUI

public typealias PurchasesError = Error
public typealias KotlinBoolean = Bool
public typealias KotlinUnit = Void

public extension Purchases {
    static var sharedInstance: Purchases {
        Purchases.shared
    }

    static func configure(apiKey: String, builder: @escaping (Configuration.Builder) -> Void = { _ in }) {
        let configurationBuilder = Configuration.Builder(withAPIKey: apiKey)
        builder(configurationBuilder)
        Purchases.configure(with: configurationBuilder)
    }
}
#endif
