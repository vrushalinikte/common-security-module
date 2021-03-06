/*L
 *  Copyright Ekagra Software Technologies Ltd.
 *  Copyright SAIC
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-security-module/LICENSE.txt for details.
 */

package gov.nih.nci.security.cgmm.helper;

import gov.nih.nci.cagrid.opensaml.SAMLAssertion;
import gov.nih.nci.security.cgmm.exceptions.CGMMGridAuthenticationServiceException;

import java.util.HashMap;

public interface SAMLToAttributeMapper
{
	
	public HashMap<String, String> convertSAMLtoHashMap(SAMLAssertion samlAssertion) throws CGMMGridAuthenticationServiceException;
	
}
