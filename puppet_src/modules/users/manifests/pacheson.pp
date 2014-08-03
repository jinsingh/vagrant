# Adding user for Paul Acheson
class users::pacheson {

  users::account {'pacheson':
    fullname => 'Paul Acheson',
    email    => 'P.Acheson@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDyB81yozvLG5RSwwDQI7S9AIusd3c5SpG9VnIP9sSTRF5YOMNJkS0a/XcB0n/Z5jeVEAcPZDTa7LMFm5Lvi1turXj/VHymHuBAf2RdXX4NmtlxDNKh6fz/bTQgCrrRoZhv0BXSc7uBL88ixJQEchP/z5N+fFY+xwmDHdI9vbDZ55PABaG+mBW4IqoTzwAjmax4nAiCG4bCVE/30OGvnGzM8eNT6hUtico8BLBlHEX1e7CqUhtAAaEqUJbcj7gSG5KOqSm5aVo1B/K8zxEGdF5LLb+JLl9s30ky8bqXRqMXyY0qnzlpYn9EAKTjwtP7vWVmOgObb/oHGZxDPmYFISdZLeX5L4KujAphDdzJCaFto9LuLX5z8nHxpY8HSkFZTrYuy0r6YhNYn2MHONCCwCMaC2P6ghEv9TjcKhRPHdCfPBJy0zPFcLJOyLcxv4YvuzoqUItsicJ8+vRAd+o/ZcnSIVy82G/8kbCFMR8arAeLkLwSC50Nsso4tgQrpwCy2c+fCfAWhOOJgJ+osZEFcQilmQUeI5luzRWhIiZAUS53q5M14DmV9ncS4BnkSdOQBSIk3WnRd/km42igi1mEqOrupmdoN5DKUqqGOzxglVlwgFb9o02RwfwqsxznpQogNAuQqEcopOBN+S0OfftRAP5BuWpD8HIiddQPMTu4Dsttqw==',
  }
}
