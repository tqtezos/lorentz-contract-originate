
```bash
❯❯❯ alpha-client --wait none originate contract ContractCreator \
  transferring 0 from $BOB_ADDRESS running \
  "$(cat create_contract.tz | tr '\n' ' ')" \
  --init "Unit" --burn-cap 0.392 --force

Waiting for the node to be bootstrapped before injection...
Current head: BLWEyJTYBiya (timestamp: 2020-01-21T21:09:28-00:00, validation: 2020-01-21T21:10:02-00:00)
Node is bootstrapped, ready for injecting operations.
Estimated gas: 13653 units (will add 100 for safety)
Estimated storage: 392 bytes added (will add 20 for safety)
Operation successfully injected in the node.
Operation hash is 'oopkHc4RuFf6TtGLZJXuDj1ZuPX7toxGi9XpMCjsTo6XWkk2Df9'
NOT waiting for the operation to be included.
Use command
  tezos-client wait for oopkHc4RuFf6TtGLZJXuDj1ZuPX7toxGi9XpMCjsTo6XWkk2Df9 to be included --confirmations 30 --branch BLWEyJTYBiyaanEyCMXFpAATamfRynJY9Y8kcW3mN6L14ViYW1E
and/or an external block explorer to make sure that it has been included.
This sequence of operations was run:
  Manager signed operations:
    From: tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm
    Fee to the baker: ꜩ0.00174
    Expected counter: 33107
    Gas limit: 13753
    Storage limit: 412 bytes
    Balance updates:
      tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ............. -ꜩ0.00174
      fees(tz1Ke2h7sDdakHJQh8WX4Z372du1KChsksyU,112) ... +ꜩ0.00174
    Origination:
      From: tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm
      Credit: ꜩ0
      Script:
        { parameter int ;
          storage unit ;
          code { CAR ;
                 DIP { NIL operation } ;
                 PUSH bool True ;
                 LOOP { DIP { UNIT ;
                              PUSH mutez 0 ;
                              NONE key_hash ;
                              CREATE_CONTRACT { parameter unit ; storage unit ; code { FAILWITH } } ;
                              DIP { DROP } ;
                              CONS ;
                              PUSH int 1 } ;
                        SUB ;
                        DUP ;
                        NEQ } ;
                 DROP ;
                 DIP { UNIT } ;
                 PAIR } }
        Initial storage: Unit
        No delegate for this contract
        This origination was successfully applied
        Originated contracts:
          KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Storage size: 135 bytes
        Paid storage size diff: 135 bytes
        Consumed gas: 13653
        Balance updates:
          tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.135
          tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257

New contract KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F originated.
Contract memorized as ContractCreator.
```

```bash
CREATOR_ADDRESS="KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F"  
```

```bash
alpha-client --wait none transfer 0 from $BOB_ADDRESS to $CREATOR_ADDRESS --arg 1
```

```bash
❯❯❯ alpha-client --wait none transfer 0 from $BOB_ADDRESS to $CREATOR_ADDRESS --arg 73 --burn-cap 21.097

Waiting for the node to be bootstrapped before injection...
Current head: BLLuEoTVMsZc (timestamp: 2020-01-22T00:57:10-00:00, validation: 2020-01-22T00:57:26-00:00)
Node is bootstrapped, ready for injecting operations.
Estimated gas: 797363 units (will add 100 for safety)
Estimated storage: 21097 bytes added (will add 20 for safety)
Operation successfully injected in the node.
Operation hash is 'ooRFiSoXin7A85gGQtsxkAwnzXQ4EjNsxsxQRTGv32rCSWBNquY'
NOT waiting for the operation to be included.
Use command
  tezos-client wait for ooRFiSoXin7A85gGQtsxkAwnzXQ4EjNsxsxQRTGv32rCSWBNquY to be included --confirmations 30 --branch BLLuEoTVMsZcLhtnJxdmDt9gKkEq5mZjz7b28sr3Wi9T2M39wSq
and/or an external block explorer to make sure that it has been included.
This sequence of operations was run:
  Manager signed operations:
    From: tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm
    Fee to the baker: ꜩ0.080009
    Expected counter: 33109
    Gas limit: 797463
    Storage limit: 21117 bytes
    Balance updates:
      tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ............. -ꜩ0.080009
      fees(tz1Ke2h7sDdakHJQh8WX4Z372du1KChsksyU,112) ... +ꜩ0.080009
    Transaction:
      Amount: ꜩ0
      From: tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm
      To: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
      Parameter: 73
      This transaction was successfully applied
      Updated storage: Unit
      Storage size: 135 bytes
      Consumed gas: 16591
    Internal operations:
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT18qt9zPXJ5oqy5ZrSwXxFEHcb4cpHEN3mg
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1F7RDqVEu1HRMkckgVwg8VrSzTATYoGg9r
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT19U81UqGJZMs5wAwM7dhafTWVb5hnGydQj
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1L55scvc14WvYaC5YjqFo91HS5rXyPNSLD
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1HuCTE8EdxH4uuCmQdms5cNAeDaecDiaeh
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1DixgdAf6Fiur1Rgcdduk5xLn9grZgRR2y
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1MjmY4VuvRYvyNy3jXR4rmSJLaGmH9i3sb
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1TfchjfZghvLBK3zwHcwf47aJwuN8gFL9z
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1SuE6KBcpNAHLZ5gUnqu5shXftb5vTJa7T
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1Fh8BRG7YogusMzYt674jQWhKfdM8bmR8y
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1VXRNYTnSu8eGMGVrXd8bMad656jRCapSq
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1Ep8XdLuzwFC8PPJsNetXpErieTKZMuAaa
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1X8zwPEsDyvPRDLiL1cxKK8tm1tmi5U2aW
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1GUA7upxCUXdTieqpy32YJPEo1zmdayZiX
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1Qr92MCpb7JT2pFp3UQVoWCSQsh3jKJvhu
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1Ni5pVdvSU7ek85J32s7XicvvQLrYikTfg
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1HeBUSAxFnyRC34JFXVJLXJ7vkHH6SJE1Z
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1RvtiaTAQGjfDyuwe2gLMJ1xVagCgxBXge
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1RWU2uVaHj8vwxifVskaA1FJGtk5vBjj2r
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT194DhWrfFCc45rPqYNzeDYMyEA2bSqoYgZ
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1E1SGqqRYemoxkn6qf9mgHAnHSGpc24vxc
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1KvgUKabLvBUfbgw2S98C7AwhkNnVhX9AK
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1Boj86psrC4uQb94VfhaxbFNgiFLhAKwrF
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1XSziKJ8TciwN67CwAsp7TWCg6STZYDhLB
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1HBG4Z2ciX4KcLryucjpt3swX2DJK4Z2CG
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1AdRbeSy3bg9mJVfMFLBMVMFF8ZSqBZ4c4
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1TCzKR4vesUeM84quYp9gcsmZPQbj91EBv
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1MaSFjzGZdUDySsWY3QJUysrt9DN6LRrJp
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1HfrDhUANZjHKvNCBHFn6Kc6ZWgmGYQcwx
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1SsL72zmxf5JQf97PBBzeXHDYKLM1rKRsW
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1GqHGb5aewCuFxG6vyzsLGdE6A9rYjEsmh
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1CVE54aRrnDy61PF7BaWZfMdJvJnWjHmuu
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1SGeRB1eREpYwPUtb1eHZqtUbg7yiqPMWK
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1XExTBMucuAxk1dCMvVGie5aemzy1oH4eJ
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1UV5iDPSwLv8NjkvM2pAtSRYkS6SZVidGv
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1GTndfGvJXLoadR95hAmAYVpkF1LLpRuMT
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1CoDr91M62YnTSfsFgw7Uu8TywsuwCGZfJ
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1FkT6vpc9sYJQvSJJ4bMZ3eLYoHYBD75ov
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1SVHpou2mfa8ckj3NvecCr92Mm292SxvHP
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1QswDS3s7Je9vhkxUSQGeUDbsBTuk7yW9J
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1XCLpizxSungAYQwtBMJN9SLzGmfs3Vg5b
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1BdeHp7fdQFFy1bpAZT58qNSBSBeAqwmPX
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1AE9y9XW4Dsi5nkfGYzyTYHkKvdSQjyb2f
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1F7KRjqbsHncjjEsJggayjAxfaeCovsKbX
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1Eq6ew6ukqfFL699qRmkomx4Vq8WCXQzfh
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1VTiYUZtQcZrvXJUcB6HvSsQbo815hocvt
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT19HuBihXPESjbFGAGzJTMhvyqEY95aBGqL
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1EmfsqiyCRuy2Px25LfP1ADuP3vQ47SZ1A
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1XTuBt1xxyT8fwmoyDEyQEqb4Qfqe1SbzT
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1QrmUbLirgPLeKXRrLHEPmRFD5vJfFLrKV
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT19wEed5VYeKSUmkTkGaN7Ah3oM1iTuAB1n
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1Szjc5aeM8KJ348jHRUJj9feQ48bMuXk6M
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1PyUzwNH3pYDjzBqPdirwqBKm3xdx88jCm
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1EprZ5UWJCWsZ6t7eZJjhJQQJLhN4gwBHZ
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1WdrXgXesSsoJJ9yyM1BJXzVrkvJoBAmTL
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1QNnQix4QNrwUsDXGo41Z2GnHYUDd7qmD4
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1W2Qe9y2YDxH8UafXomDzH5RpL7pQtv5fa
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1HtLoCfW5u3b9mwVpNegLdYJXm6eh9dPEK
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1BQ3YkvdoPQpEaj83LfwGgJvsiCoDhauW1
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1GjR3YeUxkhA8RgjDpKmKSfxoEgVEtSpsS
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1EC13raBH4zsPPoANHQMnFGBS54BwxQS7o
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1GdNj75fAukKpiC9nH5NtdBaPtgiqEo5Fk
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1LsLyeAxXpG9mdJuPSwEgpjCLt4T6ceaiJ
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1SnLtYv5HFb39GRehdP7wvTXhyKs49dRCj
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1G6smbLw5xm2zeQDS6NATGUcr2RZGCL5uJ
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1X2wJFGmHXjCbydtF4BKxgjHmid8zkRZK5
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1JTZqMoHWfEA86X35zbfuhEnPSQtAhw16i
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1BBPH4vHYvsg5TcemwgzFTTE516pfhLG6d
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1FG2hj3iWJj1Ry1PMEre9vFciW6LKCAx6z
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT18axjgyZQyzUhS3ehXC9DPdMxDTBr3fHY6
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT19xDeaffDpNpHGtFFQnHDzndQddBN5vpTt
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1VbYZ95TbmE94vu2SKz4fgHfeFTL3ufZWH
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10695
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257
      Origination:
        From: KT1PZcuX86B7UXdXXRYgEy36bbUL31eVt17F
        Credit: ꜩ0
        Script:
          { parameter unit ; storage unit ; code { FAILWITH } }
          Initial storage: Unit
          No delegate for this contract
          This origination was successfully applied
          Originated contracts:
            KT1SnMc3rspvEURVjingbkFj2gGYLEFrvCsq
          Storage size: 32 bytes
          Paid storage size diff: 32 bytes
          Consumed gas: 10696
          Balance updates:
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.032
            tz1bDCu64RmcpWahdn9bWrDMi6cu7mXZynHm ... -ꜩ0.257

New contract KT18qt9zPXJ5oqy5ZrSwXxFEHcb4cpHEN3mg originated.
New contract KT1F7RDqVEu1HRMkckgVwg8VrSzTATYoGg9r originated.
New contract KT19U81UqGJZMs5wAwM7dhafTWVb5hnGydQj originated.
New contract KT1L55scvc14WvYaC5YjqFo91HS5rXyPNSLD originated.
New contract KT1HuCTE8EdxH4uuCmQdms5cNAeDaecDiaeh originated.
New contract KT1DixgdAf6Fiur1Rgcdduk5xLn9grZgRR2y originated.
New contract KT1MjmY4VuvRYvyNy3jXR4rmSJLaGmH9i3sb originated.
New contract KT1TfchjfZghvLBK3zwHcwf47aJwuN8gFL9z originated.
New contract KT1SuE6KBcpNAHLZ5gUnqu5shXftb5vTJa7T originated.
New contract KT1Fh8BRG7YogusMzYt674jQWhKfdM8bmR8y originated.
New contract KT1VXRNYTnSu8eGMGVrXd8bMad656jRCapSq originated.
New contract KT1Ep8XdLuzwFC8PPJsNetXpErieTKZMuAaa originated.
New contract KT1X8zwPEsDyvPRDLiL1cxKK8tm1tmi5U2aW originated.
New contract KT1GUA7upxCUXdTieqpy32YJPEo1zmdayZiX originated.
New contract KT1Qr92MCpb7JT2pFp3UQVoWCSQsh3jKJvhu originated.
New contract KT1Ni5pVdvSU7ek85J32s7XicvvQLrYikTfg originated.
New contract KT1HeBUSAxFnyRC34JFXVJLXJ7vkHH6SJE1Z originated.
New contract KT1RvtiaTAQGjfDyuwe2gLMJ1xVagCgxBXge originated.
New contract KT1RWU2uVaHj8vwxifVskaA1FJGtk5vBjj2r originated.
New contract KT194DhWrfFCc45rPqYNzeDYMyEA2bSqoYgZ originated.
New contract KT1E1SGqqRYemoxkn6qf9mgHAnHSGpc24vxc originated.
New contract KT1KvgUKabLvBUfbgw2S98C7AwhkNnVhX9AK originated.
New contract KT1Boj86psrC4uQb94VfhaxbFNgiFLhAKwrF originated.
New contract KT1XSziKJ8TciwN67CwAsp7TWCg6STZYDhLB originated.
New contract KT1HBG4Z2ciX4KcLryucjpt3swX2DJK4Z2CG originated.
New contract KT1AdRbeSy3bg9mJVfMFLBMVMFF8ZSqBZ4c4 originated.
New contract KT1TCzKR4vesUeM84quYp9gcsmZPQbj91EBv originated.
New contract KT1MaSFjzGZdUDySsWY3QJUysrt9DN6LRrJp originated.
New contract KT1HfrDhUANZjHKvNCBHFn6Kc6ZWgmGYQcwx originated.
New contract KT1SsL72zmxf5JQf97PBBzeXHDYKLM1rKRsW originated.
New contract KT1GqHGb5aewCuFxG6vyzsLGdE6A9rYjEsmh originated.
New contract KT1CVE54aRrnDy61PF7BaWZfMdJvJnWjHmuu originated.
New contract KT1SGeRB1eREpYwPUtb1eHZqtUbg7yiqPMWK originated.
New contract KT1XExTBMucuAxk1dCMvVGie5aemzy1oH4eJ originated.
New contract KT1UV5iDPSwLv8NjkvM2pAtSRYkS6SZVidGv originated.
New contract KT1GTndfGvJXLoadR95hAmAYVpkF1LLpRuMT originated.
New contract KT1CoDr91M62YnTSfsFgw7Uu8TywsuwCGZfJ originated.
New contract KT1FkT6vpc9sYJQvSJJ4bMZ3eLYoHYBD75ov originated.
New contract KT1SVHpou2mfa8ckj3NvecCr92Mm292SxvHP originated.
New contract KT1QswDS3s7Je9vhkxUSQGeUDbsBTuk7yW9J originated.
New contract KT1XCLpizxSungAYQwtBMJN9SLzGmfs3Vg5b originated.
New contract KT1BdeHp7fdQFFy1bpAZT58qNSBSBeAqwmPX originated.
New contract KT1AE9y9XW4Dsi5nkfGYzyTYHkKvdSQjyb2f originated.
New contract KT1F7KRjqbsHncjjEsJggayjAxfaeCovsKbX originated.
New contract KT1Eq6ew6ukqfFL699qRmkomx4Vq8WCXQzfh originated.
New contract KT1VTiYUZtQcZrvXJUcB6HvSsQbo815hocvt originated.
New contract KT19HuBihXPESjbFGAGzJTMhvyqEY95aBGqL originated.
New contract KT1EmfsqiyCRuy2Px25LfP1ADuP3vQ47SZ1A originated.
New contract KT1XTuBt1xxyT8fwmoyDEyQEqb4Qfqe1SbzT originated.
New contract KT1QrmUbLirgPLeKXRrLHEPmRFD5vJfFLrKV originated.
New contract KT19wEed5VYeKSUmkTkGaN7Ah3oM1iTuAB1n originated.
New contract KT1Szjc5aeM8KJ348jHRUJj9feQ48bMuXk6M originated.
New contract KT1PyUzwNH3pYDjzBqPdirwqBKm3xdx88jCm originated.
New contract KT1EprZ5UWJCWsZ6t7eZJjhJQQJLhN4gwBHZ originated.
New contract KT1WdrXgXesSsoJJ9yyM1BJXzVrkvJoBAmTL originated.
New contract KT1QNnQix4QNrwUsDXGo41Z2GnHYUDd7qmD4 originated.
New contract KT1W2Qe9y2YDxH8UafXomDzH5RpL7pQtv5fa originated.
New contract KT1HtLoCfW5u3b9mwVpNegLdYJXm6eh9dPEK originated.
New contract KT1BQ3YkvdoPQpEaj83LfwGgJvsiCoDhauW1 originated.
New contract KT1GjR3YeUxkhA8RgjDpKmKSfxoEgVEtSpsS originated.
New contract KT1EC13raBH4zsPPoANHQMnFGBS54BwxQS7o originated.
New contract KT1GdNj75fAukKpiC9nH5NtdBaPtgiqEo5Fk originated.
New contract KT1LsLyeAxXpG9mdJuPSwEgpjCLt4T6ceaiJ originated.
New contract KT1SnLtYv5HFb39GRehdP7wvTXhyKs49dRCj originated.
New contract KT1G6smbLw5xm2zeQDS6NATGUcr2RZGCL5uJ originated.
New contract KT1X2wJFGmHXjCbydtF4BKxgjHmid8zkRZK5 originated.
New contract KT1JTZqMoHWfEA86X35zbfuhEnPSQtAhw16i originated.
New contract KT1BBPH4vHYvsg5TcemwgzFTTE516pfhLG6d originated.
New contract KT1FG2hj3iWJj1Ry1PMEre9vFciW6LKCAx6z originated.
New contract KT18axjgyZQyzUhS3ehXC9DPdMxDTBr3fHY6 originated.
New contract KT19xDeaffDpNpHGtFFQnHDzndQddBN5vpTt originated.
New contract KT1VbYZ95TbmE94vu2SKz4fgHfeFTL3ufZWH originated.
New contract KT1SnMc3rspvEURVjingbkFj2gGYLEFrvCsq originated.
```




