/**
 * @(#)AftersaleGetPeriodFlow.java, 十二月 22, 2024.
 * <p>
 * Copyright 2024 memberclub.com. All rights reserved.
 * memberclub.COM PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.memberclub.sdk.aftersale.flow.preview;

import com.memberclub.common.extension.ExtensionManager;
import com.memberclub.common.flow.FlowNode;
import com.memberclub.domain.context.aftersale.preview.AfterSalePreviewContext;
import com.memberclub.sdk.aftersale.extension.preview.AftersaleBasicValidateExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author: 掘金五阳
 */
@Service
public class AftersalePeriodValidateFlow extends FlowNode<AfterSalePreviewContext> {

    @Autowired
    private ExtensionManager extensionManager;

    @Override
    public void process(AfterSalePreviewContext context) {
        extensionManager.getExtension(context.toDefaultBizScene(), AftersaleBasicValidateExtension.class)
                .validatePeriod(context);
    }
}