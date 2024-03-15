// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Hooks} from "../../../src/libraries/Hooks.sol";
import {ICLPoolManager} from "../../../src/pool-cl/interfaces/ICLPoolManager.sol";
import {PoolKey} from "../../../src/types/PoolKey.sol";

import {BaseCLTestHook} from "./BaseCLTestHook.sol";

contract CLNoOpTestHook is BaseCLTestHook {
    uint16 bitmap;

    function setHooksRegistrationBitmap(uint16 _bitmap) external {
        bitmap = _bitmap;
    }

    function getHooksRegistrationBitmap() external view override returns (uint16) {
        return bitmap;
    }

    function beforeAddLiquidity(
        address,
        PoolKey calldata,
        ICLPoolManager.ModifyLiquidityParams calldata,
        bytes calldata
    ) external pure override returns (bytes4) {
        return Hooks.NO_OP_SELECTOR;
    }

    function beforeRemoveLiquidity(
        address,
        PoolKey calldata,
        ICLPoolManager.ModifyLiquidityParams calldata,
        bytes calldata
    ) external pure override returns (bytes4) {
        return Hooks.NO_OP_SELECTOR;
    }

    function beforeSwap(address, PoolKey calldata, ICLPoolManager.SwapParams calldata, bytes calldata)
        external
        pure
        override
        returns (bytes4)
    {
        return Hooks.NO_OP_SELECTOR;
    }

    function beforeDonate(address, PoolKey calldata, uint256, uint256, bytes calldata)
        external
        pure
        override
        returns (bytes4)
    {
        return Hooks.NO_OP_SELECTOR;
    }
}
