//
//  ConveienceAdherence.swift
//  
//
//  Created by PJ Fechner on 7/7/20.
//

import Foundation

//MARK: ExpressibleByNilLiteral Extensions

// This make propertyWrappers adhere to OptionalCodingWrapper when wrapped value is Optional

extension TransientEncoding: OptionalWrapper where T: ExpressibleByNilLiteral { }
extension TransientDecoding: OptionalWrapper where T: ExpressibleByNilLiteral { }
extension TransientCoding: OptionalWrapper where T: ExpressibleByNilLiteral { }

extension DecodingUses: OptionalWrapper where CustomDecoder.DecodedType: ExpressibleByNilLiteral { }
extension EncodingUses: OptionalWrapper where CustomEncoder.OriginalType: ExpressibleByNilLiteral { }
extension CodingUses: OptionalWrapper where CustomCoder.CodingType: ExpressibleByNilLiteral { }
