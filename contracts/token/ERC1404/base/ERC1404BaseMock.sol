// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {ERC1404Base} from './ERC1404Base.sol';
import {ERC1404Storage} from './ERC1404Storage.sol';

contract ERC1404BaseMock is ERC1404Base {
  using ERC1404Storage for ERC1404Storage.Layout;

  constructor (
    uint8[] memory errorCodes, string[] memory errorMessages
  ) {
    ERC1404Storage.layout().setRestrictions(errorCodes, errorMessages);
  }

  function _detectTransferRestriction (
    address, address, uint
  ) override internal pure returns (uint8) {
    return 0;
  }

  function __mint (
    address account,
    uint amount
  ) external {
    _mint(account, amount);
  }

  function __burn (
    address account,
    uint amount
  ) external {
    _burn(account, amount);
  }
}