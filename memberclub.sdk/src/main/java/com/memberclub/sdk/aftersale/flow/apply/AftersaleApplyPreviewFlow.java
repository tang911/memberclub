/**
 * @(#)AftersaleApplyPreviewFlow.java, 一月 01, 2025.
 * <p>
 * Copyright 2025 memberclub.com. All rights reserved.
 * memberclub.COM PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.memberclub.sdk.aftersale.flow.apply;

import com.memberclub.common.flow.FlowNode;
import com.memberclub.domain.context.aftersale.apply.AfterSaleApplyContext;
import com.memberclub.domain.context.aftersale.apply.AfterSaleExecuteCmd;
import com.memberclub.domain.context.aftersale.preview.AfterSalePreviewCmd;
import com.memberclub.domain.context.aftersale.preview.AfterSalePreviewContext;
import com.memberclub.infrastructure.mapstruct.AftersaleConvertor;
import com.memberclub.sdk.aftersale.service.AfterSaleBizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author: 掘金五阳
 */
@Service
public class AftersaleApplyPreviewFlow extends FlowNode<AfterSaleApplyContext> {

    @Autowired
    private AfterSaleBizService aftersaleBizService;

    @Override
    public void process(AfterSaleApplyContext context) {
        AfterSalePreviewCmd previewCmd = AftersaleConvertor.INSTANCE.toPreviewCmd(context.getApplyCmd());
        previewCmd.setPreviewBeforeApply(true);
        AfterSalePreviewContext previewContext = aftersaleBizService.doPreview(previewCmd);

        AfterSaleExecuteCmd executeCmd = previewContext.toExecuteCmd();
        executeCmd.setScene(context.getScene());
        executeCmd.setApplyCmd(context.getApplyCmd());

        context.setExecuteCmd(executeCmd);
        context.setMemberOrder(previewContext.getMemberOrder());
    }


}