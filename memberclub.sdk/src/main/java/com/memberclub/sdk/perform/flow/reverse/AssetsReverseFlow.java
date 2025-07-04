/**
 * @(#)ReverseAssetsFlow.java, 一月 01, 2025.
 * <p>
 * Copyright 2025 memberclub.com. All rights reserved.
 * memberclub.COM PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.memberclub.sdk.perform.flow.reverse;

import com.memberclub.common.extension.ExtensionManager;
import com.memberclub.common.flow.FlowNode;
import com.memberclub.domain.context.perform.reverse.PerformItemReverseInfo;
import com.memberclub.domain.context.perform.reverse.ReversePerformContext;
import com.memberclub.sdk.perform.extension.reverse.RightsReverseExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.memberclub.common.extension.ExtensionManager.extension;

/**
 * author: 掘金五阳
 */
@Service
public class AssetsReverseFlow extends FlowNode<ReversePerformContext> {

    @Autowired
    private ExtensionManager em;

    @Override
    public void process(ReversePerformContext context) {
        List<PerformItemReverseInfo> items = context.getCurrentSubOrderReversePerformContext().getCurrentItems();

        String scene = String.valueOf(context.getCurrentSubOrderReversePerformContext().getCurrentRightType());
        RightsReverseExtension rightsReverseExtension = extension(context.getBizType().toBizScene(scene), RightsReverseExtension.class);
        rightsReverseExtension.reverse(context, context.getCurrentSubOrderReversePerformContext(), items);
    }
}